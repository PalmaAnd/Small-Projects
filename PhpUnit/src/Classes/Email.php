<?php
declare(strict_types=1);

namespace Unittesting\Classes;

class Email
{

    /**
     * Validates and creates a mail with the given string
     *
     * @param string $mail
     * @return string if the given mail was valid
     * @return false if the given mail was not written in a valid format
     */
    public function createMail(string $mail)
    {
        $pattern = "^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,10}$";
        /** 
         * @var boolean $is_valid 
         * Validates the given string, with the RegEx defined in $pattern 
         * 
         * The / symbol is needed, because otherwise PHP will return an error,
         * because preg_match searches a ending delimiter for ^
         */
        $is_valid = preg_match('/' . $pattern . '/', $mail);
        if ($is_valid){
            return $mail;
        } else {
            return 'Please enter a valid email address';
        }
    }

}
