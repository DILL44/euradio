<?php

namespace RadioSolution\ContactBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use RadioSolution\ContactBundle\Form\EnquiryType;
use RadioSolution\ContactBundle\Entity\Enquiry;

class PageController extends Controller
{
public function contactAction()
{
    $enquiry = new Enquiry();
    $form = $this->createForm(new EnquiryType(), $enquiry);

    $request = $this->getRequest();
    if ($request->getMethod() == 'POST') {
        $form->bindRequest($request);

        if ($form->isValid()) {
			$message = \Swift_Message::newInstance()
            	->setSubject('Contact enquiry from symblog')
            	->setFrom('enquiries@symblog.co.uk')
            	->setTo('test.dill.44@gmail.com')
            	->setBody($this->renderView('ContactBundle:Page:contactEmail.txt.twig', array('enquiry' => $enquiry)));
       		$this->get('mailer')->send($message);

        	$this->get('session')->setFlash('notification', 'Votre message à bien été envoyé. Merci!');

        	// Redirect - This is important to prevent users re-posting
        	// the form if they refresh the page
        	return $this->redirect($this->generateUrl('Contact'));
        }
    }
    
    $em = $this->getDoctrine()->getEntityManager();
    
    $entity = $em->getRepository('StaticContentBundle:StaticContent')->findOneById(30);
    
    if (!$entity) {
    	throw $this->createNotFoundException('Unable to find StaticContent entity.');
    }
    

    return $this->render('ContactBundle:Page:contact.html.twig', array(
        'form' => $form->createView(),
    	'entity'      => $entity
    ));
}
}