<?php
/**
 * Browser language auto-detection
 * Parses Accept-Language header and loads the best matching language file.
 *
 * @author           H2OGame Contributors
 * @license          See H2O.LICENSE.txt
 */

namespace H2O;
defined('H2O') or exit('Access denied');

/**
 * Detect the best language based on browser Accept-Language header.
 * Returns a language code that has a corresponding language file.
 *
 * @param string $sModPath  Full path to the module's languages/ directory
 * @param string $sFallback Fallback language code (default: 'en')
 * @return string           Resolved language code
 */
function h2o_detect_language($sModPath, $sFallback = 'en')
{
    // Priority 1: user preference stored in session
    if (!empty($_SESSION['h2o_lang'])) {
        $sLang = preg_replace('/[^a-z]/', '', strtolower($_SESSION['h2o_lang']));
        if (is_file($sModPath . $sLang . '.php')) {
            return $sLang;
        }
    }

    // Priority 2: ?lang=xx URL parameter (allows manual override)
    if (!empty($_GET['lang'])) {
        $sLang = preg_replace('/[^a-z]/', '', strtolower($_GET['lang']));
        if (is_file($sModPath . $sLang . '.php')) {
            $_SESSION['h2o_lang'] = $sLang;
            return $sLang;
        }
    }

    // Priority 3: parse Accept-Language header
    $sHeader = isset($_SERVER['HTTP_ACCEPT_LANGUAGE']) ? $_SERVER['HTTP_ACCEPT_LANGUAGE'] : '';
    if (!empty($sHeader)) {
        // Parse tags with quality values, e.g. "zh-CN,zh;q=0.9,en;q=0.8"
        $aTags = [];
        foreach (explode(',', $sHeader) as $sPart) {
            $sPart = trim($sPart);
            if (preg_match('/^([a-zA-Z]{2,3})(?:[_\-][a-zA-Z]{2,4})?(?:;q=([0-9.]+))?$/', $sPart, $aM)) {
                $sCode = strtolower($aM[1]);
                $fQ    = isset($aM[2]) ? (float)$aM[2] : 1.0;
                $aTags[$sCode] = max($fQ, isset($aTags[$sCode]) ? $aTags[$sCode] : 0);
            }
        }
        arsort($aTags);

        foreach (array_keys($aTags) as $sCode) {
            if (is_file($sModPath . $sCode . '.php')) {
                $_SESSION['h2o_lang'] = $sCode;
                return $sCode;
            }
        }
    }

    return $sFallback;
}

/**
 * Load core language file with browser auto-detection.
 *
 * @param string $sCoreLangPath  Path to Script/_server/app/languages/
 * @param string $sModLangPath   Path to the current module's languages/
 */
function h2o_load_language($sCoreLangPath, $sModLangPath)
{
    $sLang = h2o_detect_language($sCoreLangPath);

    // Load core language
    $sCoreFile = $sCoreLangPath . $sLang . '.php';
    if (!is_file($sCoreFile)) {
        $sCoreFile = $sCoreLangPath . 'en.php';
    }
    require $sCoreFile;

    // Load module language
    $sModFile = $sModLangPath . $sLang . '.php';
    if (!is_file($sModFile)) {
        $sModFile = $sModLangPath . 'en.php';
    }
    if (is_file($sModFile)) {
        require $sModFile;
    }
}
