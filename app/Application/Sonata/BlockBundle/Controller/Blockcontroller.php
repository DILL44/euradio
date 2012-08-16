<?php
namespace Application\Sonata\BlockBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpFoundation\Response;


class BlockController extends Controller
{
    public function indexAction()
    {
        return $this->render('ApplicationSonataBlockBundle:Blog:full_page.html.twig',
        array(
        	'test'=>'truc',
        	'test2'=>'truc2'));
    }
    
    
    
}