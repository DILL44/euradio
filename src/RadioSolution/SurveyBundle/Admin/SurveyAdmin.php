<?php 
namespace RadioSolution\SurveyBundle\Admin;
 
use RadioSolution\SurveyBundle\Entity\Survey;
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;

class SurveyAdmin extends Admin
{
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
      ->add('name')
      ->add('enable')
      ->add('script')
    ;
  }
 
  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
      ->add('name')
      ->add('enable')
    ;
  }
 
  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
      ->addIdentifier('name')
      ->add('enable')
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
