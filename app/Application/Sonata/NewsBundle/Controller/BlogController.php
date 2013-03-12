<?php
<<<<<<< HEAD
namespace Application\Sonata\NewsBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpFoundation\Response;


class BlogController extends Controller
{
    public function indexAction()
    {
        return $this->render('ApplicationSonataNewsBundle:Blog:full_page.html.twig',
        array(
        	'test'=>'truc',
        	'test2'=>'truc2'));
    }
}
=======
/*
 * This file is part of the Sonata package.
 *
 * (c) Thomas Rabaix <thomas.rabaix@sonata-project.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Application\Sonata\NewsBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

use Symfony\Component\Form\Form;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Sonata\NewsBundle\Model\CommentInterface;
use Sonata\NewsBundle\Model\PostInterface;

class BlogController extends Controller
{

    public function IndexAction()
    {   /*
    	$domain = $this->get('request')->server->get('HTTP_HOST');
    	$em = $this->getDoctrine()->getEntityManager();
        $categories = $em->getRepository('ApplicationSonataNewsBundle:Category')->findAll();    	
    	return $this->render('ApplicationSonataNewsBundle:Blog:full_page.html.twig', array(
    			'categories'  => $categories,
    			'domain'=>$domain,
    	));
    	*/
    	$em = $this->getDoctrine()->getEntityManager();
    	$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Post p 
    								WHERE p.enabled =  1  
    									ORDER BY p.publicationDateStart DESC')
    				->setMaxResults(10);
    	$post = $query->getResult();
    	
    	return $this->render('ApplicationSonataNewsBundle:Blog:full_page.html.twig', array(
    			'posts'  => $post,
    	));
    	 
    }
    
    public function LastPostAction($idCategory)
    {		
    	$em = $this->getDoctrine()->getEntityManager();
		$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Post p WHERE p.category =  :category  ORDER BY p.publicationDateStart DESC')->setParameter('category', $idCategory)->setMaxResults(1);
		$post = $query->getResult();

    	return $this->render('ApplicationSonataNewsBundle:Blog:image_last_post.html.twig', array(
    			'posts'  => $post,
    	));
    }
    
    public function FivePostAction($idCategory)
    {
    	$domain = $this->get('request')->server->get('HTTP_HOST');
    	$em = $this->getDoctrine()->getEntityManager();
		$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Post p WHERE p.category = :category ORDER BY p.publicationDateStart DESC')->setParameter('category', $idCategory)->setMaxResults(5);
		$posts = $query->getResult();

    	return $this->render('ApplicationSonataNewsBundle:Blog:five_last_post.html.twig', array(
    			'posts'  => $posts,
    			'domain' => $domain,
    	));
    }
    
}
>>>>>>> master
