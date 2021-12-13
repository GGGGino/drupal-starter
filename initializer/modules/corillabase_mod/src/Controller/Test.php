<?php

namespace Drupal\corillabase_mod\Controller;

use Drupal\Core\Controller\ControllerBase;

// /api/test
class Test extends ControllerBase {

  public function test() {
    return [
      '#type' => 'markup',
      '#markup' => $this->t('Hello, World!'),
    ];
  }

}