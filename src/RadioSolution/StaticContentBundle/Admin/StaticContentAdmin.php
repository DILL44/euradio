<?php 
namespace RadioSolution\StaticContentBundle\Admin;
 
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;

class StaticContentAdmin extends Admin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
      ->add('name')
      ->add('title')
      ->add('image','sonata_type_model',array(),array('edit' => 'list','link_parameters' => array('provider'=>'sonata.media.provider.image')))
      ->add('introduction')
      ->add('body', 'textarea', array('attr' => array('class' => 'tinymce', 'tinymce'=>'{"theme":"medium"}')))
      ->add('CategoryStaticContent', 'sonata_type_model',array('required' => false))
    ;
  }
 
  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
      ->add('name')
    ;
  }
 
  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
      ->addIdentifier('name')
    ;
  }
 
  public function validate(ErrorElement $errorElement, $object)
  {
    $errorElement
      ->with('name')
      ->assertMaxLength(array('limit' => 32))
      ->end()
    ;
  }
}