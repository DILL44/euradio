<?php

namespace RadioSolution\StaticContentBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;


class DefaultController extends Controller
{
    
    public function indexAction($name)
    {
        return $this->render('StaticContentBundle:Default:index.html.twig', array('name' => $name));
    }
}
