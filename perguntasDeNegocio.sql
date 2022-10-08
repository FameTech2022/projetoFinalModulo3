use resilia;

/*QUAL É A QUANTIDADE DE ESTUDANTES CADASTRADOS?*/
select count(*) as quantAlunos from alunos;

/*QUAIS OS CURSOS EM QUE OS ALUNOS ESTÃO MATRICULADOS?*/
SELECT 
    aluno, curso
FROM
    alunos
        INNER JOIN
    alunocurso ON alunos.matricula = alunocurso.matricula
        INNER JOIN
    curso ON curso.idCurso = alunocurso.idCurso;
    
    /*QUAIS FACILITADORES ATUAM EM MAIS DE UMA TURMA?*/
    select funcionario, count(codModulo) as quantTurma
    from 
    funcionario 
    inner join 
    facilitadormodulo on funcionario.idFuncionario = facilitadormodulo.idFuncionario
    group by funcionario
    having quantTurma >1;
    
    /*QUAIS OS 10 ALUNOS MELHOR AVALIADOS?*/
    select aluno, avg(nota) as media
    from alunonota 
    inner join 
    alunos on alunonota.matricula = alunos.matricula
    group by aluno
    order by media desc limit 10;
    

    
    
    
    
    
    
    
    
    
    
    
    


