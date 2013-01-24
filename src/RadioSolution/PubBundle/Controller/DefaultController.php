<?php

namespace RadioSolution\PubBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;


class DefaultController extends Controller
{
    
    public function indexAction()
    {
    	$em = $this->getDoctrine()->getEntityManager();
    	$query = $em->createQuery("SELECT p FROM PubBundle:Pub p WHERE p.enable=true ORDER BY p.order_pub ASC");
    	$entities=$query->getResult();
        return $this->render('PubBundle:Default:index.html.twig', array('entities' => $entities));
    }
}
