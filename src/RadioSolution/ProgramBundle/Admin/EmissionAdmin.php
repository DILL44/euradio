<?php 
namespace RadioSolution\ProgramBundle\Admin;
 
use Symfony\Component\Form\Extension\Core\DataTransformer\DateTimeToTimestampTransformer;
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
      ->add('description')
      ->add('theme', 'sonata_type_model',array('required' => false))
      ->add('group', 'sonata_type_model',array('required' => false))
      ->add('media', 'sonata_type_model',array('required' => false),array('edit' => 'list','link_parameters' => array('provider'=>'sonata.media.provider.image')))
      ->add('archive',null,array('required' => false))
      ->add('frequency', 'sonata_type_model',array('required' => false))
    ->with('Diffusions')
    ->add('diffusion_start', 'date')
    ->add('difusion_stop','date')
    ->add('ExceptionalBroadcast', 'sonata_type_collection', array('required' => false), array(
                'edit' => 'inline',
    			'inline' => 'table',
            ))
    ->add('WeeklyBroadcast', 'sonata_type_collection', array('required' => false), array(
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
  	$newDate=new \DateTime();
  	$newDate2=new \DateTime();
  	//$file=fopen('/var/www/git/euradio/src/RadioSolution/ProgramBundle/Admin/log.txt','w');
  	 
  	$q=$this->createQuery()->delete('ProgramBundle:Program','p')  	
  	->where('p.emission = :id_emmission')
  	->setParameter('id_emmission',(String)$object->getId());
  	$q->getQuery()->execute();
  	
  	$exceptional=$object->getExceptionalBroadcast();
  	
  	foreach ($exceptional as $value){
  		$timezone = $value->getTimeStart()->getTimezone();
  		$value->setEmission($object);
  		
  		$program=new Program();
  		$program->setTimeStart($value->getTimeStart());
  		$timeValue=$value->getTimeStart()->getTimestamp()+$value->getDuration()->getTimestamp();
  		$program->setTimeStop($newDate->setTimestamp($timeValue));
  		$program->setEmission($object);
  		
  		
  		$this->prePersist($program);
  		$this->getModelManager()->create($program);
  		$this->postPersist($program);
  		$this->createObjectSecurity($program);
  	}
  	
  	$weekly=$object->getWeeklyBroadcast();
  	$timeStampDay=3600*24;
  	$timeStampWeek=$timeStampDay*7; 
  	

  	$timestamp = $object->getDiffusionStart()->getTimestamp();
  	$dateDay=date("N",$timestamp);
  	foreach ($weekly as $value){
  		while($dateDay!=$value->getDay()){
  			$timestamp+=$timeStampDay;
  			$dateDay=date("N",$timestamp);
  		}
  		for($timestamp;$timestamp<$object->getDifusionStop()->getTimestamp();$timestamp+=$timeStampWeek){
  			$value->setEmission($object);
  			$program=new Program();
  			$program->setTimeStart($newDate->setTimestamp($timestamp+$value->getHour()->getTimestamp()));
  			$timeValue=$program->getTimeStart()->getTimestamp()+$value->getDuration()->getTimestamp();
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
      ->assertMaxLength(array('limit' => 32))
      ->end()
    ;
  }
  
}
