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
	public function showAction()
	{
		$em = $this->getDoctrine()->getEntityManager();

		$entities = $em->getRepository('StaticContentBundle:CategoryStaticContent')->findAll();

		if (!$entity) {
			throw $this->createNotFoundException('Unable to find StaticContent entity.');
		}

		return $this->render('StaticContentBundle:CategoryStaticContent:accueil.html.twig', array(
				'entities'      => $entities,
		));
	}

}
