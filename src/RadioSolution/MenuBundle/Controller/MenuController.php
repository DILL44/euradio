<?php

namespace RadioSolution\MenuBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use RadioSolution\MenuBundle\Entity\Menu;

/**
 * Menu controller.
 *
 * @Route("/menu")
 */
class MenuController extends Controller
{
    /**
     * Lists all Menu entities.
     *
     * @Route("/", name="menu")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entities = $em->getRepository('MenuBundle:Menu')->findAll();

        return array('entities' => $entities);
    }

    /**
     * Finds and displays a Menu entity.
     *
     * @Route("/{id}/show", name="menu_show")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entity = $em->getRepository('MenuBundle:Menu')->find($id);
        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Menu entity.');
        }
        return array(
            'entity'      => $entity,
        );
    }
    public function mainMenu(FactoryInterface $factory, array $options)
    {
    	$em = $this->getDoctrine()->getEntityManager();
    	$entity = $em->getRepository('MenuBundle:Menu')->find($id);
    	$entities = $em->getRepository('MenuBundle:I')->findAll();
    	
    	print_r($entity);
    	print_r($entities);
    	
    	$menu = $factory->createItem('menu');
    
    	//$menu->addChild('blog', array('uri' => '/euradio/app_dev.php/news'));
    	//$menu->addChild('page test', array('uri' => '/euradio/app_dev.php/blog/blog'));
    	// ... add more children
    
    	return $menu;
    }

}
