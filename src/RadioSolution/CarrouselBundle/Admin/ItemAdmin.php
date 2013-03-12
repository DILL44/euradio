<?php 
namespace RadioSolution\CarrouselBundle\Admin;
 
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
 
class ItemAdmin extends Admin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
      ->add('order_int')
      ->add('slider','sonata_type_model')
      ->add('category_static_content', 'sonata_type_model',array('required' => false), array('edit' => 'list'))
      ->add('static_content', 'sonata_type_model',array('required' => false), array('edit' => 'list'))
      ->add('emission', 'sonata_type_model',array('required' => false), array('edit' => 'list'))
      ->add('podcast', 'sonata_type_model',array('required' => false), array('edit' => 'list'))
      ->add('custum_item', 'sonata_type_model',array('required' => false), array('edit' => 'list'))
    ;
  }
 
  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
      ->add('slider')
    ;
  }
 
  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
      ->addIdentifier('order_int')      
      ->add('slider')
      ->add('category_static_content')
      ->add('static_content')
      ->add('emission')
      ->add('podcast')
      ->add('custom_item')
      ->add('_action', 'actions', array(
      		'actions' => array(
      				'view' => array(),
      				'edit' => array(),
      		)
      ))
    ;
  }
 
  public function validate(ErrorElement $errorElement, $object)
  {
  	if(!($object->getCategoryStaticContent() &&
  	   !$object->getStaticContent() &&
  	   !$object->getEmission() &&	
  	   !$object->getPodcast() &&
       !$object->getCustumItem()
  	|| !$object->getCategoryStaticContent() &&
  	   $object->getStaticContent() &&
  	   !$object->getEmission() &&	
  	   !$object->getPodcast() &&
       !$object->getCustumItem()
  	|| !$object->getCategoryStaticContent() &&
  	   !$object->getStaticContent() &&
  	   $object->getEmission() &&	
  	   !$object->getPodcast() &&
       !$object->getCustumItem()
  	|| !$object->getCategoryStaticContent() &&
  	   !$object->getStaticContent() &&
  	   !$object->getEmission() &&	
  	   $object->getPodcast() &&
       !$object->getCustumItem()
|| !$object->getCategoryStaticContent() &&
  	   !$object->getStaticContent() &&
  	   !$object->getEmission() &&	
  	   !$object->getPodcast() &&
       $object->getCustumItem())){
  		$errorElement->with('value')->addViolation('un item doit contenir un et un seul champ de référence')->end();

  	}

  /*  $errorElement
      ->with('title')
      ->assertMaxLength(array('limit' => 32))
      ->end()*/
    ;
  }
}