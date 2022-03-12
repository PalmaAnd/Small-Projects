<?php

declare(strict_types=1);

namespace Unittesting\Tests;

use PHPUnit\Framework\TestCase;
use Unittesting\Classes\Email as Mail;

class EmailTest extends TestCase
{

    /**
     * @test Test function for User::createMail what should result in a success.
     * @return success
     */
    public function testCreateMail()
    {
        $this->assertEquals('max.mustermann@unit.testing', (new Mail)->createMail('max', 'mustermann'), 'Running: Email::createMail');
    }
}
