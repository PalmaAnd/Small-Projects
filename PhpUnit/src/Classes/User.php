<?php

declare(strict_types=1);

namespace Unittesting\Classes;

/**
 * undocumented class
 */
class User
{

    private $fullname;
    private $age;
    private $mail;

    function __construct($fullname, $age, $mail)
    {
        $this->fullname = $fullname;
        $this->age = $age;
        $this->mail = $mail;
    }

    /**
     * Get the value of fullname
     */
    public function getFullname()
    {
        return $this->fullname;
    }

    /**
     * Get the value of age
     */
    public function getAge()
    {
        return $this->age;
    }

    /**
     * Set the value of fullname
     *
     * @return  self
     */
    public function setFullname($fullname)
    {
        $this->fullname = $fullname;

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
     * Create a user with the given username, age and mail.
     *
     * @param Type $var Description
     * @return type
     * @throws conditon
     **/
    public function createUser(string $fullname, int $age, Email $mail = null)
    {
        # code...
    }

}
