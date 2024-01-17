import { Resolver, Query, Mutation, Args, ResolveField, Parent } from '@nestjs/graphql';
import { CanvassService } from './canvass.service';
import { Canvass } from './entities/canvass.entity';
import { CreateCanvassInput } from './dto/create-canvass.input';
import { UpdateCanvassInput } from './dto/update-canvass.input';
import { RemoveResponse } from 'src/__common__/entities';
import { Employee } from 'src/__common__/entities/employee.entity';
import { lastValueFrom } from 'rxjs';

@Resolver(() => Canvass)
export class CanvassResolver {
  constructor(private readonly canvassService: CanvassService) {}

  @Mutation(() => Canvass)
  createCanvass(@Args('input') createCanvassInput: CreateCanvassInput) {
    return this.canvassService.create(createCanvassInput);
  }

  @Query(() => [Canvass])
  canvasses() {
    return this.canvassService.findAll();
  }

  @Query(() => Canvass)
  canvass(@Args('id', { type: () => String }) id: string) {
    console.log('canvass')
    return this.canvassService.findOne(id);
  }

  @Mutation(() => Canvass)
  updateCanvass(
    @Args('id') id: string,
    @Args('input') updateCanvassInput: UpdateCanvassInput
  ) {
    return this.canvassService.update(id, updateCanvassInput);
  }

  @Mutation(() => RemoveResponse)
  removeCanvass(@Args('id', { type: () => String }) id: string) {
    return this.canvassService.remove(id);
  }

  @Query(() => String)
  rc_number() {
    return this.canvassService.findLatestRcNumber()
  }

  @ResolveField(() => Employee)
  async requested_by(@Parent() canvass: Canvass): Promise<Employee | null> {
    const employeeId = canvass.requested_by_id;
  
    try {
      const response = await lastValueFrom(this.canvassService.getEmployee(employeeId));
      return response;
    } catch (error) {
      if (error.response && error.response.status === 404) {
        // Handle not found error
        console.error('Employee not found:');
      } else {
        // Handle other errors
        console.error('Error fetching employee:');
      }
      return null;
    }
  }

}
