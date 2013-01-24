<?php
namespace RadioSolution\ProgramBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class BlockController extends Controller
{
	public function FiveEmissionAction()
	{
		$domain = $this->get('request')->server->get('HTTP_HOST');
		$em = $this->getDoctrine()->getEntityManager();
		$query = $em->createQuery('SELECT p FROM ProgramBundle:Emission p ORDER BY p.diffusion_start DESC')->setMaxResults(5);
		$posts = $query->getResult();
	
		return $this->render('ProgramBundle:Block:five_emissions.html.twig', array(
				'posts'  => $posts,
				'domain' => $domain,
		));
	}
}