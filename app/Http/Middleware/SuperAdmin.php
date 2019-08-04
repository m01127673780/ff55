<?php

namespace App\Http\Middleware;

use Closure;
use Auth ;

class SuperAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    
    public function handle($request, Closure $next)
    {
       
if (\Auth::guard('admin')->group_id == 1) {
    dd('SuperAdmin');
return $next($request);
}else {
return redirect('/admin/superadmin');

    }
}
