<?php 
namespace  RadioSolution\MenuBundle\Menu;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Symfony\Component\DependencyInjection\ContainerAware;
use Knp\Menu\FactoryInterface;


class Builder extends Controller
{
    public function mainMenu(FactoryInterface $factory, array $options )
    {
    	$domain = $this->get('request')->server->get('HTTP_HOST');
    	$options['idmenu']=1;
    	$em = $this->getDoctrine()->getEntityManager();
    	
    	$menu = $em->getRepository('MenuBundle:Menu')->find($options['idmenu']);
    	$menu = $factory->createItem($menu);
    	
    	$items = $em->createQuery('SELECT i FROM MenuBundle:Item i WHERE i.menu= :id_menu AND i.parent IS NULL ORDER BY i.order_item ASC')
    	->setParameters(array(
     		'id_menu'=> $options['idmenu'],
		))->getResult();
    	
    	foreach ($items as $key=>$values){
    		$item=$menu->addChild($values->getName(), array('uri' => '/'.$values->getUrl()));
    		$this->addChild($em,$values,$item,$options['idmenu']);
    	}
    	return $menu;
    }
    
    protected function addChild($em, $entityItem, $item, $idmenu){
    	$domain = $this->get('request')->server->get('HTTP_HOST');
    	$items = $em->createQuery('SELECT i FROM MenuBundle:Item i WHERE i.menu= :id_menu AND i.parent= :id_parent' )
    	->setParameters(array(
    			'id_menu'=> $idmenu,
    			'id_parent' => $entityItem->getId(),
    	))->getResult();
    	foreach ($items as $key=>$values){
    		$subitem = $item->addChild($values->getName(), array('uri' => '/'.$values->getUrl()));
    		$this->addChild($em,$values,$subitem,$idmenu);
    	}
    }
    
    public function footerMenu(FactoryInterface $factory, array $options )
    {
    	$domain = $this->get('request')->server->get('HTTP_HOST');
    	$options['idmenu']=4;
    	$em = $this->getDoctrine()->getEntityManager();
    	
    	$menu = $em->getRepository('MenuBundle:Menu')->find($options['idmenu']);
    	$menu = $factory->createItem($menu);
    	
    	$items = $em->createQuery('SELECT i FROM MenuBundle:Item i WHERE i.menu= :id_menu AND i.parent IS NULL ORDER BY i.order_item ASC')
    	->setParameters(array(
     		'id_menu'=> $options['idmenu'],
		))->getResult();
    	
    	foreach ($items as $key=>$values){
    		$item=$menu->addChild($values->getName(), array('uri' => '/'.$values->getUrl()));
    		$this->addChild($em,$values,$item,$options['idmenu']);
    	}
    	return $menu;
    }
    
    
    public function footerLinks(FactoryInterface $factory, array $options )
    {
    	$domain = $this->get('request')->server->get('HTTP_HOST');
    	$options['idmenu']=5;
    	$em = $this->getDoctrine()->getEntityManager();
    	
    	$menu = $em->getRepository('MenuBundle:Menu')->find($options['idmenu']);
    	$menu = $factory->createItem($menu);
    	
    	$items = $em->createQuery('SELECT i FROM MenuBundle:Item i WHERE i.menu= :id_menu AND i.parent IS NULL ORDER BY i.order_item ASC')
    	->setParameters(array(
     		'id_menu'=> $options['idmenu'],
		))->getResult();
    	
    	foreach ($items as $key=>$values){
    		$item=$menu->addChild($values->getName(), array('uri' => '/'.$values->getUrl()));
    		$this->addChild($em,$values,$item,$options['idmenu']);
    	}
    	return $menu;
    }
    
    
}