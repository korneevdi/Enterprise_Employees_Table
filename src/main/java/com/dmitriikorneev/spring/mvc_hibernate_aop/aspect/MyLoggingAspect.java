package com.dmitriikorneev.spring.mvc_hibernate_aop.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class MyLoggingAspect {

    /* Logging will be processed before and after specified methods
       Stars: any return type, any class from dao, any method, any number of parameters */
    @Around("execution(* com.dmitriikorneev.spring.mvc_hibernate_aop.dao.*.*(..))")
    public Object aroungAllRepositoryMethodsAdvice(
            ProceedingJoinPoint proceedingJoinPoint) throws Throwable {

        MethodSignature methodSignature = (MethodSignature) proceedingJoinPoint.getSignature();
        String methodName = methodSignature.getName();
        System.out.println("Start of " + methodName);

        Object targerMethodResult = proceedingJoinPoint.proceed();
        System.out.println("End of " + methodName);

        return targerMethodResult;
    }
}
