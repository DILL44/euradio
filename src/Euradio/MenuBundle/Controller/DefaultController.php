<?php

namespace Euradio\MenuBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;


class DefaultController extends Controller
{
    
    public function indexAction($name)
    {
        return $this->render('EuradioMenuBundle:Default:index.html.twig', array('name' => $name));
    }
}
