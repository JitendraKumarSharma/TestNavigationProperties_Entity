using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace TestNavigationProperties_Entity
{
    class Program
    {
        static void Main(string[] args)
        {
            EntityDatabaseEntities entity = new EntityDatabaseEntities();
            var emplist = entity.Employees.ToList();
            var deptlist = entity.Departments.ToList();
            var empmail = entity.Employees.Where(x => x.Gender == "Male").ToList();
            var empspeficdep = entity.Employees.Where(x => x.Department.Name == "IT").ToList();
            var empdep = entity.Departments.Include("Employees").ToList();
            var dd = entity.Employees.Include("Department").Include("EmployeeDetails").Include("EmployeeProjects").Where(x => x.ID == 1).ToList();
            var aa = entity.EmployeeDetails.Include(x => x.Employee).Select(i => new
            {
                Name = i.Employee.FirstName,
                Gender = i.Employee.Gender
            }).ToList();
            var bb = entity.EmployeeDetails.Include(x => x.Employee.Department).Select(i=> new
            {
                Dname=i.Employee.Department.Name
            }).ToList();
            var cc = entity.EmployeeDetails.Include(x => x.Employee).Where(a => a.Empld == 1).ToList();
            var ee = entity.EmployeeDetails.Include(x => x.Employee).Select(a => a.Employee.FirstName).ToList();
        }
    }
}
