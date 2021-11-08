# Preview all emails at http://localhost:3000/rails/mailers/notify_fail_mailer
class NotifyFailMailerPreview < ActionMailer::Preview
    def alert_admin
        # Set up a temporary order for the preview
        student = Student.new(name: "Joe Smith", age: 20, marks1: 50, marks2: 50, marks3: 50, student_class_id: 10)
    
        NotifyFailMailer.alert_admin(student)
        # NotifyFailMailer.with(student: student).alert_admin
    
      end
end
