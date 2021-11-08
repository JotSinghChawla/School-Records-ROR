class NotifyFailMailer < ApplicationMailer
    def alert_admin(student)
        @name = student.name
        @age = student.age
        @class_id = student.student_class_id
        @marks1 = student.marks1
        @marks2 = student.marks2
        @marks3 = student.marks3
        mail(
            from: "jot.chawla.56.js@gmail.com",
            to: "jot.chawla.54.js@gmail.com", 
            subject: 'Alert: Student failed in few subjects'
        )
    end
end
