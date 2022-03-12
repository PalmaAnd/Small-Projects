<?php

declare(strict_types=1);

namespace Unittesting\Tests;

use PHPUnit\Framework\TestCase;
use Unittesting\Classes\User;

class UserTest extends TestCase
{
    public function testCreateUser()
    {
        $testUser = new User('Max', 'Mustermann', 21, 'max.mustermann@unit.testing');
        $this->assertEquals($testUser, User::createUser('Max', 'Mustermann', 21));
    }
}
