<?php

namespace RadioSolution\StaticContentBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use RadioSolution\StaticContentBundle\Entity\StaticContent;

/**
 * StaticContent controller.
 *
 */
class BlockController extends Controller
{
	/**
	 * Finds and displays a StaticContent entity.
	 *
	 */
	public function InfoAction()
	{
		$em = $this->getDoctrine()->getEntityManager();

		$entities = $em->getRepository('StaticContentBundle:CategoryStaticContent')->findByParent(6);

		return $this->render('StaticContentBundle:CategoryStaticContent:accueil.html.twig', array(
				'entities'      => $entities,
				'id_name'		=>'services-example-1',
				'title'			=>'L\'info'
		));
	}
	/**
	 * Finds and displays a StaticContent entity.
	 *
	 */
	public function MusiqueAction()
	{
		$em = $this->getDoctrine()->getEntityManager();
	
		$entities = $em->getRepository('StaticContentBundle:CategoryStaticContent')->findByParent(7);
	
		return $this->render('StaticContentBundle:CategoryStaticContent:accueil.html.twig', array(
				'entities'      => $entities,
				'id_name'		=>'services-example-2',
				'title'			=>'La musique'
		));
	}
	/**
	 * Finds and displays a StaticContent entity.
	 *
	 */
	public function JsAction()
	{
		return $this->render('StaticContentBundle:CategoryStaticContent:JsAccueil.html.twig', array());
	}
	
}
