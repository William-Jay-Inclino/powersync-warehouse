import { Module } from '@nestjs/common';
import { CanvassService } from './canvass.service';
import { CanvassResolver } from './canvass.resolver';
import { CommonPurchasingService } from 'src/__common__/common.purchasing.service';
import { PrismaService } from 'src/__prisma__/prisma.service';
import { HttpModule } from '@nestjs/axios';

@Module({
  imports: [HttpModule],
  providers: [
    CanvassResolver, 
    CanvassService, 
    CommonPurchasingService, 
    PrismaService],
})
export class CanvassModule {}
