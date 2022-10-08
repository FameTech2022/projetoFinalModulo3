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
    
    /*QUAIS OS 5 FACILITADORES MELHOR AVALIADOS?*/
    select funcionario, avg(avaliacao) as avaliacao
    from funcionario 
    inner join 
    avaliacaofacilitador on funcionario.idFuncionario = avaliacaofacilitador.idFuncionario
    group by funcionario
    order by avaliacao desc
    limit 5;
    
    /*QUAIS OS ALUNOS ESTÃO COM OS PAGAMENTOS EM ATRASO?*/
    select aluno, Data_Venc,statusPgto from pagamentos
    inner join 
    alunos on alunos.matricula = pagamentos.matricula
    where 
    pagamentos.statusPgto="pendente" and Data_Venc<current_date();

    
    
    
    
    
    
    
    
    
    
    
    


