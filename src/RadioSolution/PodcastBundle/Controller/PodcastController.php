<?php

namespace RadioSolution\PodcastBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use RadioSolution\PodcastBundle\Entity\Podcast;

/**
 * Podcast controller.
 *
 * @Route("/podcast")
 */
class PodcastController extends Controller
{
    /**
     * Lists all Podcast entities.
     *
     * @Route("/", name="podcast")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entities = $em->getRepository('PodcastBundle:Podcast')->findAll();

        return array('entities' => $entities);
    }

    /**
     * Finds and displays a Podcast entity.
     *
     * @Route("/{id}/show", name="podcast_show")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entity = $em->getRepository('PodcastBundle:Podcast')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Podcast entity.');
        }

        return array(
            'entity'      => $entity,
        );
    }

}
