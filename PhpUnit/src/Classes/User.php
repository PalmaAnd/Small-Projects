<?php

declare(strict_types=1);

use Unittesting\Classes\Email;

namespace Unittesting\Classes;

/**
 * undocumented class
 */
class User
{

    private $firstname;
    private $lastname;
    private $age;
    private $mail;

    function __construct($firstname, $lastname, $age, $mail)
    {
        $this->firstname = $firstname;
        $this->lastname = $lastname;
        $this->age = $age;
        $this->mail = $mail;
    }

    /**
     * Get the value of firstname
     */
    public function getfirstname()
    {
        return $this->firstname;
    }

    /**
     * Get the value of age
     */
    public function getAge()
    {
        return $this->age;
    }

    /**
     * Set the value of firstname
     *
     * @return  self
     */
    public function setfirstname($firstname)
    {
        $this->firstname = $firstname;

        return $this;
    }

    /**
     * Get the value of lastname
     */
    public function getLastname()
    {
        return $this->lastname;
    }

    /**
     * Set the value of lastname
     *
     * @return  self
     */
    public function setLastname($lastname)
    {
        $this->lastname = $lastname;

        return $this;
    }

    /**
     * Set the value of age
     *
     * @return  self
     */
    public function setAge($age)
    {
        $this->age = $age;

        return $this;
    }

    /**
     * Get the value of mail
     */
    public function getMail()
    {
        return $this->mail;
    }

    /**
     * Set the value of mail
     *
     * @return  self
     */
    public function setMail($mail)
    {
        $this->mail = $mail;

        return $this;
    }

    /**
     * Create a user with the given username, age and mail.
     * If no mail was give, create a mail by using first- and lastname.
     *
     * @param string $firstname
     * @param integer $age
     * @param Email|null $mail
     * @return void
     */
    public function createUser(string $firstname, string $lastname, int $age, Email $mail = null)
    {
        if (empty($mail)) {
            $mail = (new Email)->createMail(strtolower($firstname), strtolower($lastname));
        }   

        $user = (new User($firstname, $lastname, $age, $mail));

        return $user;
    }
}
