<?php
namespace RadioSolution\ProgramBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class BlockController extends Controller
{
	public function FiveEmissionAction()
	{

		$em = $this->getDoctrine()->getEntityManager();
		$query = $em->createQuery('SELECT p FROM ProgramBundle:Emission p ORDER BY p.diffusion_start DESC')->setMaxResults(5);
		$posts = $query->getResult();
	
		return $this->render('ProgramBundle:Block:five_emissions.html.twig', array(
				'posts'  => $posts,

		));
	}
	public function otherEmissionAction($limit = 5)
	{

		$em = $this->getDoctrine()->getEntityManager();
		$query = $em->createQuery('SELECT p FROM ProgramBundle:Emission p ORDER BY p.diffusion_start DESC');
		$query->setMaxResults($limit);
		$posts = $query->getResult();
	
		return $this->render('ProgramBundle:Block:other_emissions.html.twig', array(
				'posts'  => $posts,

		));
	}
	

	
	
	
}