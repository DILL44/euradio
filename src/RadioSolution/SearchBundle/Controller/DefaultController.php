<?php

namespace RadioSolution\SearchBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;


class DefaultController extends Controller
{
    
    public function indexAction()
    {
        return $this->render('SearchBundle:Default:index.html.twig');
    }
}
