<?php

namespace RadioSolution\SurveyBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;


class DefaultController extends Controller
{
    
    public function indexAction()
    {
    	$Survey = $this->getDoctrine()->getRepository('SurveyBundle:Survey')->findOneByEnable(true);
        return $this->render('SurveyBundle:Default:index.html.twig', array('survey' => $Survey));
    }
}
