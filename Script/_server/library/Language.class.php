<?php
/**
 * @author           Pierre-Henry Soria <ph7software@gmail.com>
 * @copyright        (c) 2014-2015, Pierre-Henry Soria. All Rights Reserved.
 * @license          See H2O.LICENSE.txt and H2O.COPYRIGHT.txt in the root directory.
 * @link             http://hizup.com
 */

namespace H2O;
defined('H2O') or exit('Access denied');

class Language
{

    const COOKIE_NAME = 'H2OLang';

    private $_sLang;

    public function __construct()
    {
        $oCookie = new Cookie;
        $sMod = Application::getModule();

        if (Admin::auth() && is_file(H2O_SERVER_PATH . 'app/modules/' . $sMod . '/languages/' . Admin::getLang() . '.php') && is_file(H2O_SERVER_PATH . 'app/languages/' . Admin::getLang() . '.php'))
        {
            $oCookie->set(self::COOKIE_NAME, Admin::getLang(), 60*60*48);
            $this->_sLang = Admin::getLang();
        }
        elseif (!empty($_REQUEST['l']) && is_file(H2O_SERVER_PATH . 'app/modules/' . $sMod . '/languages/' . $_REQUEST['l'] . '.php') && is_file(H2O_SERVER_PATH . 'app/languages/' . $_REQUEST['l'] . '.php'))
        {
            $oCookie->set(self::COOKIE_NAME, $_REQUEST['l'], 60*60*48);
            $this->_sLang = $_REQUEST['l'];
        }
        elseif ($oCookie->exists(self::COOKIE_NAME) && is_file(H2O_SERVER_PATH . 'app/modules/' . $sMod . '/languages/' . $oCookie->get(self::COOKIE_NAME) . '.php') && is_file(H2O_SERVER_PATH . 'app/languages/' . $oCookie->get(self::COOKIE_NAME) . '.php'))
        {
            $this->_sLang = $oCookie->get(self::COOKIE_NAME);
        }
        else
        {
            $sBrowser = $this->getBrowser($sMod);
            if (!empty($sBrowser))
            {
                $this->_sLang = $sBrowser;
            }
            else
            {
                $this->_sLang = Controller::DEFAULT_LANG;
            }
        }
        unset($oCookie);
    }

    /**
     * Get the best matching language from the browser's Accept-Language header.
     * Supports quality values (q=) and region subtags (zh-CN, en-US).
     *
     * @param string $sMod Current module name, used to check language file existence.
     * @return string|null Two-letter language code, or null if no match found.
     */
    public function getBrowser($sMod = null)
    {
        if (empty($_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
            return null;
        }

        if ($sMod === null) {
            $sMod = Application::getModule();
        }

        $aTags = [];
        foreach (explode(',', $_SERVER['HTTP_ACCEPT_LANGUAGE']) as $sPart) {
            $sPart = trim($sPart);
            // Match: zh-CN, en-US, fr;q=0.8, ar;q=0.9, etc.
            if (preg_match('/^([a-zA-Z]{2,3})(?:[_\-][a-zA-Z]{2,4})?(?:;q=([0-9.]+))?$/', $sPart, $aM)) {
                $sCode = strtolower($aM[1]);
                $fQ    = isset($aM[2]) ? (float)$aM[2] : 1.0;
                // Keep the highest quality score for duplicate codes
                if (!isset($aTags[$sCode]) || $aTags[$sCode] < $fQ) {
                    $aTags[$sCode] = $fQ;
                }
            }
        }

        // Sort by quality descending
        arsort($aTags);

        foreach (array_keys($aTags) as $sCode) {
            $sCode = htmlspecialchars($sCode, ENT_QUOTES);
            if (
                is_file(H2O_SERVER_PATH . 'app/modules/' . $sMod . '/languages/' . $sCode . '.php') &&
                is_file(H2O_SERVER_PATH . 'app/languages/' . $sCode . '.php')
            ) {
                return $sCode;
            }
        }

        return null;
    }

    public function get()
    {
        return $this->_sLang;
    }

}
