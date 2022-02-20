<?php
declare(strict_types=1);

namespace Unittesting\Tests;

use PHPUnit\Framework\TestCase;
use Unittesting\Classes\Email as Mail;

class EmailTest extends TestCase
{

    public function testCreateMail()
    {
        $this->assertEquals('max.mustermann@unit.testing', (new Mail)->createMail('max.mustermann@unit.testing'), 'Running: Email::createMail');
    }

    public function testCreateMailFail(){
        $this->assertEquals('Please enter a valid email address', (new Mail)->createMail('maxmuasterman.unit.com'), 'Running: Email::createMail with false mail address');
    }

}
