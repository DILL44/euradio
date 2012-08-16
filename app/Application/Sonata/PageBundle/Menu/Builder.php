<?php 
namespace Application\Sonata\PageBundle\Menu;

use Knp\Menu\FactoryInterface;
use Symfony\Component\DependencyInjection\ContainerAware;

class Builder extends ContainerAware
{
    public function mainMenu(FactoryInterface $factory, array $options)
    {
        $menu = $factory->createItem('menu');

        $menu->addChild('blog', array('uri' => '/euradio/app_dev.php/news'));
        $menu->addChild('page test', array('uri' => '/euradio/app_dev.php/blog/blog'));
        // ... add more children

        return $menu;
    }
}