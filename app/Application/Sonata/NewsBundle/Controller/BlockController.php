<?php
namespace Application\Sonata\NewsBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class BlockController extends Controller
{
	public function FivePostAction()
	{
		$domain = $this->get('request')->server->get('HTTP_HOST');
		$em = $this->getDoctrine()->getEntityManager();
		$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Post p ORDER BY p.publicationDateStart DESC')->setMaxResults(5);
		$posts = $query->getResult();
	
		return $this->render('ApplicationSonataNewsBundle:Block:five_last_post.html.twig', array(
				'posts'  => $posts,
				'domain' => $domain,
		));
	}
	public function FiveTagAction()
	{
		$domain = $this->get('request')->server->get('HTTP_HOST');
		$em = $this->getDoctrine()->getEntityManager();
		$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Tag p ORDER BY p.updatedAt DESC')->setMaxResults(5);
		$posts = $query->getResult();
	
		return $this->render('ApplicationSonataNewsBundle:Block:five_last_tag.html.twig', array(
				'posts'  => $posts,
				'domain' => $domain,
		));
	}
	public function FiveCategoryAction()
	{
		$domain = $this->get('request')->server->get('HTTP_HOST');
		$em = $this->getDoctrine()->getEntityManager();
		$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Category p ORDER BY p.updatedAt DESC')->setMaxResults(5);
		$posts = $query->getResult();
	
		return $this->render('ApplicationSonataNewsBundle:Block:five_last_category.html.twig', array(
				'posts'  => $posts,
				'domain' => $domain,
		));
	}
}