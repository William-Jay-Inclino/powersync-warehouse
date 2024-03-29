import { InputType, Field } from '@nestjs/graphql';
import { Transform, Type } from 'class-transformer';
import { IsArray, IsDate, IsNotEmpty, IsOptional, IsString, ValidateNested } from 'class-validator';
import { CreateItemInput } from '../../item/dto/create-item.input';

@InputType()
export class CreateCanvassInput {

  @Field(() => String)
  @IsNotEmpty()
  @IsString()
  rc_number: string;

  @Field(() => String)
  @IsNotEmpty()
  @Transform(({ value }) => new Date(value))
  @IsDate()
  date_requested: string;

  @Field(() => String)
  @IsNotEmpty()
  @IsString()
  purpose: string;

  @Field(() => String, {nullable: true})
  @IsString()
  @IsOptional()
  notes?: string | null;

  @Field(() => String)
  @IsNotEmpty()
  @IsString()
  requested_by_id: string;

  @Field(() => String)
  @IsNotEmpty()
  @IsString()
  noted_by_id: string;

  @Field(() => [CreateItemInput])
  @IsNotEmpty()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => CreateItemInput)
  items: CreateItemInput[];

}
