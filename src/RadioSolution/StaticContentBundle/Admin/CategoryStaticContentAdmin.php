<?php 
namespace RadioSolution\StaticContentBundle\Admin;
 
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
 
class CategoryStaticContentAdmin extends Admin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
      ->add('name')
      ->add('body')
      ->add('image','sonata_type_model',array(),array('edit' => 'list','link_parameters' => array('provider'=>'sonata.media.provider.image')))
      ->add('parent', 'sonata_type_model', array('required' => false))
    ;
  }
 
  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
      ->add('name', null, array('label' => 'Nom'))
      ->add('parent', null, array('label' => 'Categorie parente'))
    ;
  }
 
  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
      ->addIdentifier('name', null, array('label' => 'Nom de la categorie'))
      ->add('parent', null, array('label' => 'Categorie parent'))
      ->add('URL', 'string', array('label' => 'URL', 'template' => 'StaticContentBundle:CategoryStaticContentAdmin:list_URL.html.twig'))  
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