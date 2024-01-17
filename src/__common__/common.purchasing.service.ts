import { ConflictException, Injectable } from '@nestjs/common';
import { PrismaService } from '../__prisma__/prisma.service';
import { DefaultApprover } from './entities/approver-setting.entity';

@Injectable()
export class CommonPurchasingService {

    constructor(private readonly prisma: PrismaService) {}
    
    async getLatestRcNumber(payload: {table: string, field: string}): Promise<string> {
      const currentYear = new Date().getFullYear().toString().slice(-2);
  
      const latestItem = await this.prisma[payload.table].findFirst({
        where: { [payload.field]: { startsWith: currentYear } },
        orderBy: { [payload.field]: 'desc' },
      });
  
      if (latestItem) {
        const latestNumericPart = parseInt(latestItem[payload.field].slice(-5), 10);
        const newNumericPart = latestNumericPart + 1;
        const newRcNumber = `${currentYear}-${newNumericPart.toString().padStart(5, '0')}`;
        return newRcNumber;
      } else {
        // If no existing rc_number with the current year prefix, start with '00001'
        return `${currentYear}-00001`;
      }
    }

    async validateRcNumberUnique(payload: {rcNumber: string, table: string, field: string}): Promise<void> {
      const existingCanvass = await this.prisma[payload.table].findUnique({
        where: { [payload.field]: payload.rcNumber },
      });
  
      if (existingCanvass) {
        throw new ConflictException(`${payload.table.toUpperCase()} with ${payload.field} ${payload.rcNumber} already exists.`);
      }
    }

    async getDefaultApprovers(payload: {table: string}): Promise<DefaultApprover[]> {

      return await this.prisma[payload.table].findMany({
        where: {
          is_deleted: false
        }
      }) as DefaultApprover[]

    }

}
