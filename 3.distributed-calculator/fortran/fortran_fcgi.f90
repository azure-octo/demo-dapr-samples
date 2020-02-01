!
! Fortran FastCGI stack
! Based on Fortran FastCGI by Ricolindo.Carino@gmail.com and arjen.markus895@gmail.com

program test_fcgi

    use fcgi_protocol
    use jade

    implicit none

    type(DICT_STRUCT), pointer  :: dict => null() ! Initialisation is important!
    logical                     :: stopped = .false. ! set to true in respond() to terminate program
    integer                     :: unitNo ! unit number  for a scratch file

    open(newunit=unitNo, status='scratch')
    !open(newunit=unitNo, file='fcgiout', status='unknown')

    ! wait for environment variables from webserver
    do while (fcgip_accept_environment_variables() >= 0)
        call fcgip_make_dictionary( dict, unitNo )
        call respond(dict, unitNo, stopped)
        call fcgip_put_file( unitNo, 'text/html' )
        if (stopped) exit
    end do

    close(unitNo)

    unitNo = fcgip_accept_environment_variables()


contains
    subroutine respond ( dict, unitNo, stopped )

        type(DICT_STRUCT), pointer        :: dict
        integer, intent(in)               :: unitNo
        logical, intent(out)              :: stopped

        ! the following are defined in fcgi_protocol
        !character(len=3), parameter :: AFORMAT = '(a)'
        !character(len=2), parameter :: CRLF = achar(13)//achar(10)
        !character(len=1), parameter :: NUL = achar(0)

        ! retrieve params from model and pass them to view
        character(len=50), dimension(10,2) :: pagevars
        character(len=50), dimension(8) :: names, latinNames, wikiLinks, descriptions
        character(len=80)  :: operandOne, operandTwo
        integer :: numOne, numTwo
        integer :: stat
        character(len=50) ::result

        ! the script name
        character(len=80)  :: scriptName, query
        character(len=12000) :: templatefile

        logical                           :: okInputs

        write(unitNo, AFORMAT) '%REMARK% respond() started ...'

        ! retrieve script name (key=DOCUMENT_URI) from dictionary
        call cgi_get( dict, "DOCUMENT_URI", scriptName )

        select case (trim(scriptName))
          case ('/')
            write(unitNo,AFORMAT) "Fortran Modulo Microservice"

          case ('/modulo')
            call cgi_get( dict, "operandOne", operandOne)
            call cgi_get( dict, "operandTwo", operandTwo)

            read(operandOne,*,iostat=stat) numOne
            read(operandTwo,*,iostat=stat) numTwo

            write(result, '(i10)') modulo(numOne,numTwo)
            write(unitNo,AFORMAT) result

          case DEFAULT
            write(unitNo,AFORMAT) 'Page not found!'

        end select

        ! end of response
        write(unitNo,AFORMAT) '%REMARK% respond() completed ...'

        return

    end subroutine respond

end program test_fcgi
