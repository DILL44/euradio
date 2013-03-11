<?php 
namespace RadioSolution\ProgramBundle\Admin;
 
use RadioSolution\ProgramBundle\Entity\Program;
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use RadioSolution\ProgramBundle\Entity\ExceptionalBroadcast;
use RadioSolution\ProgramBundle\Entity\WeeklyBroadcast;


class EmissionAdmin extends Admin
{
  protected function configureFormFields(FormMapper $formMapper)
  {

    $formMapper
      ->add('name')
      ->add('description', 'textarea', array('attr' => array('class' => 'tinymce', 'tinymce'=>'{"theme":"medium"}')))
      ->add('theme', 'sonata_type_model',array('required' => false))
      ->add('group', 'sonata_type_model',array('required' => false))
      ->add('media', 'sonata_type_model',array('required' => false),array('edit' => 'list','link_parameters' => array('provider'=>'sonata.media.provider.image')))
      ->add('archive',null,array('required' => false))
      ->add('frequency', 'sonata_type_model',array('required' => false))
    ->with('Diffusions')
    ->add('difusion_stop','date', array('data_timezone' => "GMT",'user_timezone' => "GMT" ))
    ->add('ExceptionalBroadcast', 'sonata_type_collection', array('required' => false, 'by_reference' =>true), array(
                'edit' => 'inline',
    			'inline' => 'table',
            ))
    ->add('WeeklyBroadcast', 'sonata_type_collection', array('required' => false, 'by_reference' =>true), array(
                'edit' => 'inline',
                'inline' => 'table',
            ))
    ->end();
    ;
  }
 
  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
      ->add('name')
      ->add('theme')
      ->add('difusion_stop')
      ->add('archive')
    ;
  }
 
  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
      ->addIdentifier('name')
      ->add('theme')
      ->add('difusion_stop')
      ->add('archive')
    ;
  }
 
  public function validate(ErrorElement $errorElement, $object)
  {
  	$timeStampDay=3600*24;
  	$timeStampWeek=$timeStampDay*7;
  	
  	$object->setDiffusionStart();
  	
  	$newDate=new \DateTime(null,new \DateTimeZone('GMT'));
  	$newDate2=new \DateTime(null,new \DateTimeZone('GMT'));
  	$now=new \DateTime('tomorrow');
  	$now->setTime('00','00');
  	$q=$this->createQuery()->delete('ProgramBundle:Program','p')  	
  	->where('p.emission = :id_emission AND p.time_start >= :now')
  	->setParameters(array('id_emission'=>(String)$object->getId(),'now'=>$now));

  	$q->getQuery()->execute();
  	
  	$exceptional=$object->getExceptionalBroadcast();
  	
  	foreach ($exceptional as $value){
  		if ($value->getTimeStart()->getTimestamp()>$now->getTimestamp()){
	  		$value->setEmission($object);  		
	  		$program=new Program();
	  		$program->setTimeStart($value->getTimeStart()->setTimezone(new \DateTimeZone('GMT')));
	  		$timeValue=$value->getTimeStart()->setTimezone(new \DateTimeZone('GMT'))->getTimestamp()+$value->getDuration()->setTimezone(new \DateTimeZone('GMT'))->getTimestamp();
	  		$program->setTimeStop($newDate->setTimestamp($timeValue));
	  		$program->setEmission($object);
	  		
	  		
	  		$this->prePersist($program);
	  		$this->getModelManager()->create($program);
	  		$this->postPersist($program);
	  		$this->createObjectSecurity($program);
  		}
  	}
  	
  	$weekly=$object->getWeeklyBroadcast();  	

  	foreach ($weekly as $value){
  		$timestamp = $object->getDiffusionStart()->setTimezone(new \DateTimeZone('GMT'))->getTimestamp()+$timeStampDay;
  		$dateDay=date("N",$timestamp);
  		while($dateDay!=$value->getDay()){
  			$timestamp+=$timeStampDay;
  			$dateDay=date("N",$timestamp);
  		}
  		for($timestamp;$timestamp<$object->getDifusionStop()->getTimestamp();$timestamp+=$timeStampWeek){
  			$value->setEmission($object);
  			$program=new Program();
  			$program->setTimeStart($newDate->setTimestamp($timestamp+$value->getHour()->setTimezone(new \DateTimeZone('GMT'))->getTimestamp()));
  			$timeValue=$program->getTimeStart()->setTimezone(new \DateTimeZone('GMT'))->getTimestamp()+$value->getDuration()->setTimezone(new \DateTimeZone('GMT'))->getTimestamp();
  			$program->setTimeStop($newDate2->setTimestamp($timeValue));
  			$program->setEmission($object);
  			
  			$this->prePersist($program);
  			$this->getModelManager()->create($program);
  			$this->postPersist($program);
  			$this->createObjectSecurity($program);
  		}

  		$value->setEmission($object);
  	}
  	
    $errorElement
      ->with('name')
      ->assertMaxLength(array('limit' => 80))
      ->end()
    ;
  }
  
}
