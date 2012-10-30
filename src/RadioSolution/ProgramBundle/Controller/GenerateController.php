<?php

namespace RadioSolution\ProgramBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;



class generateController extends Controller
{
	public function programGeneration($TimeStart,$TimeStop,$Emission)
	{
		$em =  $this->getDoctrine()->getEntityManager() ;
			
		$program=new Program();
		$program->setTimeStart($TimeStart);
		$program->setTimeStop($TimeStop);
		$program->setEmission($Emission);
			
		$em->persist($program) ;
		$em->flush() ;
	}
}
