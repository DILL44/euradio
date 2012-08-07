<?php
require_once __DIR__.'/../vendor/pheanstalk/pheanstalk_init.php';
use Symfony\Component\ClassLoader\UniversalClassLoader;
use Doctrine\Common\Annotations\AnnotationRegistry;

$loader = new UniversalClassLoader();
$loader->registerNamespaces(array(
	//original namespace
    'Symfony'          => array(__DIR__.'/../vendor/symfony/src', __DIR__.'/../vendor/bundles'),
    'Sensio'           => __DIR__.'/../vendor/bundles',
    'JMS'              => __DIR__.'/../vendor/bundles',
    'Doctrine\\Common' => __DIR__.'/../vendor/doctrine-common/lib',
    'Doctrine\\DBAL'   => __DIR__.'/../vendor/doctrine-dbal/lib',
    'Doctrine'         => __DIR__.'/../vendor/doctrine/lib',
    'Monolog'          => __DIR__.'/../vendor/monolog/src',
    'Assetic'          => __DIR__.'/../vendor/assetic/src',
    'Metadata'         => __DIR__.'/../vendor/metadata/src',

	//adding namespace
	'FOS'			   => __DIR__.'/../vendor/bundles',	
	'COil'             => __DIR__.'/../vendor/bundles',
	'Stfalcon'         => __DIR__.'/../vendor/bundles',
	'EWZ'              => __DIR__.'/../vendor/bundles',
    'Knp\\Component'   => __DIR__.'/../vendor/knp-components/src',
    'Knp\\Bundle'      => __DIR__.'/../vendor/bundles',
    'Sonata'           => array(
        __DIR__.'/../vendor/bundles',
        __DIR__.'/../vendor/bundles/Sonata/sonata-doctrine-extensions/src',
    ),
	'Application'      => __DIR__,
	'Knp\Bundle'       => __DIR__.'/../vendor/bundles',
    'Knp\Menu'         => __DIR__.'/../vendor/knp/menu/src',
	'Tutorial'         => __DIR__.'/../src',
    'PhpAmqpLib'       => __DIR__ . '/../vendor/php-amqplib',
    'Imagine'          => __DIR__.'/../vendor/imagine/lib',
    'Gaufrette'        => __DIR__.'/../vendor/gaufrette/src',
    'Buzz'             => __DIR__.'/../vendor/buzz/lib',
    'Wowo'             => __DIR__.'/../vendor/bundles',
    'Ps' 			   => __DIR__.'/../vendor/bundles',
    'PHPPdf'		   => __DIR__.'/../vendor/PHPPdf/lib',
    'Imagine' 		   => array(
       __DIR__.'/../vendor/PHPPdf/lib', 
       __DIR__.'/../vendor/PHPPdf/lib/vendor/Imagine/lib'
    ),
    'Zend' 			   => __DIR__.'/../vendor/PHPPdf/lib/vendor/Zend/library',//If you have used ZF2 packages already, you should skip this entry
    'ZendPdf' 		   => __DIR__.'/../vendor/PHPPdf/lib/vendor/ZendPdf/library',
    'Eko'              => __DIR__.'/../vendor/bundles',
    'Sly'              => __DIR__.'/../vendor/bundles',
    'Gregwar' 		   => __DIR__.'/../vendor/bundles',
    'Vich'             => __DIR__.'/../vendor/bundles'
));
$loader->registerPrefixes(array(
    'Twig_Extensions_' => __DIR__.'/../vendor/twig-extensions/lib',
    'Twig_'            => __DIR__.'/../vendor/twig/lib',
));

// intl
if (!function_exists('intl_get_error_code')) {
    require_once __DIR__.'/../vendor/symfony/src/Symfony/Component/Locale/Resources/stubs/functions.php';

    $loader->registerPrefixFallbacks(array(__DIR__.'/../vendor/symfony/src/Symfony/Component/Locale/Resources/stubs'));
}

$loader->registerNamespaceFallbacks(array(
    __DIR__.'/../src',
));
$loader->register();

AnnotationRegistry::registerLoader(function($class) use ($loader) {
    $loader->loadClass($class);
    return class_exists($class, false);
});
AnnotationRegistry::registerFile(__DIR__.'/../vendor/doctrine/lib/Doctrine/ORM/Mapping/Driver/DoctrineAnnotations.php');

require __DIR__.'/../vendor/swiftmailer/lib/swift_required.php';
