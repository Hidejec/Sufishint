<?php

// autoload_psr4.php @generated by Composer

$vendorDir = dirname(dirname(__FILE__));
$baseDir = dirname($vendorDir);

return array(
    'Slim\\Views\\' => array($vendorDir . '/slim/twig-view/src'),
    'Slim\\' => array($vendorDir . '/slim/slim/Slim'),
    'Psr\\Http\\Message\\' => array($vendorDir . '/psr/http-message/src'),
    'Model\\' => array($baseDir . '/app/Model'),
    'Interop\\Container\\' => array($vendorDir . '/container-interop/container-interop/src/Interop/Container'),
    'Helper\\' => array($baseDir . '/app/Helper'),
    'FastRoute\\' => array($vendorDir . '/nikic/fast-route/src'),
    'Controller\\' => array($baseDir . '/app/Controller'),
);
