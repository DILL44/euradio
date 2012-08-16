<?php
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