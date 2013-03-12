<?php

namespace RadioSolution\PodcastBundle\Controller;

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
	public function AccueilAction($limit = 14)
	{
		$domain = $this->get('request')->server->get('HTTP_HOST');
		
		$em = $this->getDoctrine()->getEntityManager();
		
		$query = $em->createQuery("SELECT p FROM PodcastBundle:Podcast p ORDER BY p.real_time_start DESC");
		$query->setMaxResults($limit);
		//$query->setFirstResult(5);
		$entities=$query->getResult();

		foreach($entities as $entity){
			$media = $entity->getFilePodcast();
			break;
		}		
		return $this->render('PodcastBundle:Podcast:bloc_accueil.html.twig', array(
				'entities'      => $entities,
				'media'			=> $media
		));
				
	}
	/**
	 * Finds and displays a StaticContent entity.
	 *
	 */
	public function homePodcastsAction($limit = 6, $showPlayer = false)
	{

		
		$em = $this->getDoctrine()->getEntityManager();
		
		//$entities = $em->createQuery('PodcastBundle:Podcast')->setMaxResults($limit);
		
		$query = $em->createQuery("SELECT p FROM PodcastBundle:Podcast p WHERE p.name != '' AND p.home_page=true ORDER BY p.real_time_start DESC");
		$query->setMaxResults(3);
		$theOne = $query->getResult();
		
		
		$query = $em->createQuery("SELECT p FROM PodcastBundle:Podcast p WHERE p.name != '' AND p.home_page=true ORDER BY p.real_time_start DESC");
		$query->setMaxResults($limit);
		$query->setFirstResult(3);
		$entities = $query->getResult();
		
		return $this->render('PodcastBundle:Podcast:bloc_homePodcasts.html.twig', array(
				'theOne'	=> $theOne,
				'entities'	=> $entities,
				'showPlayer'	=> $showPlayer,

		));
	}
}
