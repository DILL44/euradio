<?php 
namespace  RadioSolution\MenuBundle\Menu;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Symfony\Component\DependencyInjection\ContainerAware;
use Knp\Menu\FactoryInterface;


class Builder extends Controller
{
    public function mainMenu(FactoryInterface $factory, array $options )
    {
    	$options['idmenu']=1;
    	$em = $this->getDoctrine()->getEntityManager();
    	
    	$menu = $em->getRepository('MenuBundle:Menu')->find($options['idmenu']);
    	$menu = $factory->createItem($menu);
    	
    	$items = $em->createQuery('SELECT i FROM MenuBundle:Item i WHERE i.menu= :id_menu AND i.parent IS NULL')
    	->setParameters(array(
     		'id_menu'=> $options['idmenu'],
		))->getResult();
    	
    	foreach ($items as $key=>$values){
    		$item=$menu->addChild($values->getName(), array('uri' => strstr('http://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'],$_SERVER['PATH_INFO'],TRUE).'/'.$values->getUrl()));
    		$this->addChild($em,$values,$item,$options['idmenu']);
    	}
    	return $menu;
    }
    
    protected function addChild($em, $entityItem, $item, $idmenu){
    	$items = $em->createQuery('SELECT i FROM MenuBundle:Item i WHERE i.menu= :id_menu AND i.parent= :id_parent' )
    	->setParameters(array(
    			'id_menu'=> $idmenu,
    			'id_parent' => $entityItem->getId(),
    	))->getResult();
    	foreach ($items as $key=>$values){
    		$subitem = $item->addChild($values->getName(), array('uri' => strstr('http://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'],$_SERVER['PATH_INFO'],TRUE).'/'.$values->getUrl()));
    		$this->addChild($em,$values,$subitem,$idmenu);
    	}
    }
}