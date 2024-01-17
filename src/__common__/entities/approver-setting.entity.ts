import { Field, Int, ObjectType } from "@nestjs/graphql";
import { Employee } from "./employee.entity";


@ObjectType()
export class DefaultApprover {

    @Field(() => String)
    id: string;

    @Field(() => String)
    approver_id: string

    @Field(() => Employee)
    approver: Employee

    @Field(() => String)
    label: string
    
    @Field(() => Int)
    order: number
}