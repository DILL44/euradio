<?php

namespace RadioSolution\MenuBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;


class DefaultController extends Controller
{
    
    public function indexAction($name)
    {
        return $this->render('RadioSolutionMenuBundle:Default:index.html.twig', array('name' => $name));
    }
}
