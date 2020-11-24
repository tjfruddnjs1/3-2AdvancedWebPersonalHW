package hibernateExampleApp;

import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import hibernateExampleModel.Employee;

public class app {
	
	static int index=0;
	static String name[] = new String[100];
	static int age[] = new int[100];
	static Employee employeeStore;
	static String input_message;
	static boolean flag = true;
	
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		while(flag) {
			input_message = scan.next();
			switch(input_message) {
				case "create" :
					System.out.println("이름을 설정해주세요 :");
					name[index] = scan.next();
					System.out.println("나이를 설정해주세요 :");
					age[index] = scan.nextInt();
					Employee em = new Employee(name[index],age[index]);
					employeeStore = em;
					create(em);
					System.out.println("("+name[index] +","+age[index]+")"+"의 사원이 데이터베이스에 생성되었습니다");
					break;
				case "read" :
					List<Employee> emRead = read();
					for(Employee e : emRead) {
						System.out.println("(이름 :"+e.getName()+", 나이 :"+e.getAge()+") 의 사원이 데이터베이스에 저장되어 있습니다.");
					}
					break;
				case "update" :
					System.out.println("가장 최근에 저장한 사원의 이름과 나이를 재설정 해주세요");
					System.out.print("이름 : ");
					name[index] = scan.next();
					System.out.print("나이 : ");
					age[index] = scan.nextInt();
					employeeStore.setName(name[index]);
					employeeStore.setAge(age[index]);
					
					update(employeeStore);
					System.out.println("( 이름 :"+name[index]+", 나이 :"+age[index]+") 으로 데이터베이스에 업데이트 되었습니다.");
					break;
				case "delete" :
					List<Employee> emDelete = read();
					System.out.println("삭제할 사원의 이름을 입력해주세요 :");
					String deleteEmp = scan.next();
					
					Iterator it =  emDelete.iterator();
					while(it.hasNext()) {
						for(Employee e : emDelete) {
							if(e.getName().equals(deleteEmp) ) {
								delete(e.getId());
								break;
							}
						}
					}
					break;
				case "exit" :
					System.out.println("시스템이 종료되었습니다.");
					flag = false;
					break;
				default :
					System.out.println("잘못된 명령어 입니다.");
					break;
			}
			
		}
	}
	
	public static SessionFactory getSessionFactory() {
		Configuration configuration = new Configuration().configure();
		StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
		
		SessionFactory sessionFactory = configuration.buildSessionFactory(builder.build());
		return sessionFactory;
	}
	
	public static Integer create(Employee e) {
		Session session = getSessionFactory().openSession();
		session.beginTransaction();
		session.save(e);
		session.getTransaction().commit();
		session.close();
		System.out.println("성골적으로 생성되었습니다.");
		return e.getId();
	}
	
	public static List<Employee> read(){
		Session session = getSessionFactory().openSession();
		List<Employee> employees = session.createQuery("FROM Employee").list();
		session.close();
		System.out.println(+ employees.size() +"의 사원들이 데이터베이스에 존재합니다.");
		return employees;
	}
	
	public static void update(Employee e){
		Session session = getSessionFactory().openSession();
		session.beginTransaction();
		Employee em = (Employee) session.load(Employee.class, e.getId());
		em.setName(e.getName());
		em.setAge(e.getAge());
		session.getTransaction().commit();
		session.close();
		System.out.println("성공적으로 업데이트 되었습니다.");
	}

	
	public static Employee findByID (Integer id){
		Session session = getSessionFactory().openSession();
		Employee e = (Employee) session.load(Employee.class , id);
		session.close();
		return e;
	}
	
	public static void delete(Integer id){
		Session session = getSessionFactory().openSession();
		session.beginTransaction();
		Employee e = findByID(id);
		session.delete(e);
		session.getTransaction().commit();
		session.close();
		System.out.println("성공적으로 삭제되었습니다");
	}
}
