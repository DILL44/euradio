<?php 
namespace  RadioSolution\MenuBundle\Menu;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Symfony\Component\DependencyInjection\ContainerAware;
use Knp\Menu\FactoryInterface;


class Builder extends Controller
{
    public function mainMenu(FactoryInterface $factory, array $options )
    {
    	$em = $this->getDoctrine()->getEntityManager();
    	$entity = $em->getRepository('MenuBundle:Menu')->find('1');
    	$entities = $em->getRepository('MenuBundle:Item')->findByMenu('1');
    	
    	$menu = $factory->createItem($entity);
    	foreach ($entities as $key=>$values){
    		$menu->addChild($values->getName(), array('uri' => '/euradio/app_dev.php/'.$values->getUrl()));
    	}
    
    	return $menu;
    }
}