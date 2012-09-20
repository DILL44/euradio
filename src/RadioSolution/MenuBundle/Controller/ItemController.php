<?php

namespace RadioSolution\MenuBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use RadioSolution\MenuBundle\Entity\Item;

/**
 * Item controller.
 *
 * @Route("/item")
 */
class ItemController extends Controller
{
    /**
     * Lists all Item entities.
     *
     * @Route("/", name="item")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entities = $em->getRepository('MenuBundle:Item')->findAll();

        return array('entities' => $entities);
    }

    /**
     * Finds and displays a Item entity.
     *
     * @Route("/{id}/show", name="item_show")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entity = $em->getRepository('MenuBundle:Item')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Item entity.');
        }

        return array(
            'entity'      => $entity,
        );
    }

}
