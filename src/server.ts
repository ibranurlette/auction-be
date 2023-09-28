import { App } from '@/app';
import { SeedersRoute } from './routes/seeders';
import { AuthRoute } from '@routes/auth.route';
import { UserRoute } from '@routes/users.route';
import { ValidateEnv } from '@utils/validateEnv';

ValidateEnv();

const seedersRoutes = [new SeedersRoute()];
const userRoutes = [new UserRoute()]
const authRoutes = [new AuthRoute()]

const app = new App([...userRoutes, ...authRoutes, ...seedersRoutes]);
app.listen();
